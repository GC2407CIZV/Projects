# Install necessary packages (run these only once)
# install.packages("readr")
# install.packages("tidyverse")
# install.packages("lubridate")
# install.packages("ggplot2")

# Load libraries
library(readr)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(dplyr)

# Define data directory (adjust as needed)
data_dir <- "dataset/" # Replace with the actual path to your data files

# Read data files
daily_activity <- read_csv(paste0(data_dir, "dailyActivity_merged.csv"))
daily_calories <- read_csv(paste0(data_dir, "dailyCalories_merged.csv"))
daily_intensities <- read_csv(paste0(data_dir, "dailyIntensities_merged.csv"))
daily_steps <- read_csv(paste0(data_dir, "dailySteps_merged.csv"))
heartrate_seconds <- read_csv(paste0(data_dir, "heartrate_seconds_merged.csv"))
hourly_calories <- read_csv(paste0(data_dir, "hourlyCalories_merged.csv"))
hourly_intensities <- read_csv(paste0(data_dir, "hourlyIntensities_merged.csv"))
hourly_steps <- read_csv(paste0(data_dir, "hourlySteps_merged.csv"))
minute_calories_narrow <- read_csv(paste0(data_dir, "minuteCaloriesNarrow_merged.csv"))
minute_intensities_narrow <- read_csv(paste0(data_dir, "minuteIntensitiesNarrow_merged.csv"))
minute_mets_narrow <- read_csv(paste0(data_dir, "minuteMETsNarrow_merged.csv"))
minute_sleep <- read_csv(paste0(data_dir, "minuteSleep_merged.csv"))
minute_steps_narrow <- read_csv(paste0(data_dir, "minuteStepsNarrow_merged.csv"))
sleep_day <- read_csv(paste0(data_dir, "sleepDay_merged.csv"))
weight_log <- read_csv(paste0(data_dir, "weightLogInfo_merged.csv"))

# Function to check dataframes (structure, summary, missing values)
check_data <- function(df, name) {
  print(paste("Checking", name, ":"))
  print(glimpse(df)) # Display first few rows and data types
  print(summary(df)) # Summary statistics
  print(paste("Missing values:", sum(is.na(df)))) # Count missing values
  cat("\n") # Add a newline for better readability
}

# Apply the check_data function to relevant dataframes
check_data(daily_activity, "daily_calories") # Example: Check daily_calories
check_data(sleep_day, "sleep_day") # Example: Check sleep_day
# Check other dataframes as needed (e.g., heart rate, hourly data)

# Convert date/time columns to appropriate formats
daily_activity$ActivityDate <- as.Date(daily_activity$ActivityDate, format = "%m/%d/%Y")
daily_calories$ActivityDay <- as.Date(daily_calories$ActivityDay, format = "%m/%d/%Y")
daily_intensities$ActivityDay <- as.Date(daily_intensities$ActivityDay, format = "%m/%d/%Y")
daily_steps$ActivityDay <- as.Date(daily_steps$ActivityDay, format = "%m/%d/%Y")
sleep_day$SleepDay <- as.Date(sleep_day$SleepDay, format = "%m/%d/%Y")
weight_log$Date <- as.Date(weight_log$Date, format = "%m/%d/%Y")

# Convert time columns using lubridate's mdy_hms for consistent parsing
heartrate_seconds$Time <- mdy_hms(heartrate_seconds$Time)
hourly_calories$ActivityHour <- mdy_hms(hourly_calories$ActivityHour)
hourly_intensities$ActivityHour <- mdy_hms(hourly_intensities$ActivityHour)
hourly_steps$ActivityHour <- mdy_hms(hourly_steps$ActivityHour)
minute_calories_narrow$ActivityMinute <- mdy_hms(minute_calories_narrow$ActivityMinute)
minute_intensities_narrow$ActivityMinute <- mdy_hms(minute_intensities_narrow$ActivityMinute)
minute_sleep$date <- mdy_hms(minute_sleep$date)
minute_steps_narrow$ActivityMinute <- mdy_hms(minute_steps_narrow$ActivityMinute)


# Inspect column names *before* merging (crucial for avoiding conflicts)
print(names(daily_activity))
print(names(daily_calories))
print(names(daily_intensities))
print(names(daily_steps))
print(names(sleep_day))
print(names(weight_log))
print(names(heartrate_seconds))
print(names(hourly_calories))
print(names(hourly_intensities))
print(names(hourly_steps))
print(names(minute_calories_narrow))
print(names(minute_intensities_narrow))
print(names(minute_sleep))
print(names(minute_steps_narrow))

# Rename columns in `daily_intensities` to prevent merge conflicts
daily_intensities <- daily_intensities %>%
  rename(
    VeryActiveDistance_intensities = VeryActiveDistance,
    ModeratelyActiveDistance_intensities = ModeratelyActiveDistance,
    LightActiveDistance_intensities = LightActiveDistance,
    SedentaryActiveDistance_intensities = SedentaryActiveDistance,
    VeryActiveMinutes_intensities = VeryActiveMinutes,
    FairlyActiveMinutes_intensities = FairlyActiveMinutes,
    LightlyActiveMinutes_intensities = LightlyActiveMinutes,
    SedentaryMinutes_intensities = SedentaryMinutes
  )

# Efficiently merge dataframes, selecting needed columns *before* joining

daily_data <- daily_activity %>%
  left_join(daily_calories, by = c("Id", "ActivityDate" = "ActivityDay")) %>%
  left_join(daily_intensities, by = c("Id", "ActivityDate" = "ActivityDay")) %>%
  left_join(daily_steps, by = c("Id", "ActivityDate" = "ActivityDay")) %>%
  select(-Calories.y) %>%
  rename(Calories = Calories.x) %>%
  filter(!is.na(TotalSteps))

merged_data <- sleep_day %>%
  rename(SleepDate = SleepDay) %>%
  left_join(daily_data, by = c("Id", "SleepDate" = "ActivityDate"))

print(names(merged_data)) # Print column names of merged data for verification

# Check for "ActivityDate" (or its variants) and rename if necessary
if ("ActivityDate" %in% names(merged_data)) {
  print("ActivityDate found. Proceeding.")
} else if ("ActivityDay" %in% names(merged_data)) {
  print("ActivityDay found. Renaming to ActivityDate.")
  merged_data <- merged_data %>% rename(ActivityDate = ActivityDay)
} else if ("SleepDate" %in% names(merged_data)) {
  print("SleepDate found. Renaming to ActivityDate.")
  merged_data <- merged_data %>% rename(ActivityDate = SleepDate)
} else {
  stop("Error: No suitable date column found in merged_data!") # Stop if no date column
}


# Calculate Weekday (after ensuring ActivityDate exists)
merged_data$Weekday <- wday(merged_data$ActivityDate, label = TRUE)

# Calculate overall averages
overall_averages <- merged_data %>%
  summarize(
    overall_avg_steps = mean(TotalSteps, na.rm = TRUE),
    overall_avg_calories = mean(Calories, na.rm = TRUE),
    overall_avg_sedentary = mean(SedentaryMinutes, na.rm = TRUE),
    overall_avg_active = mean(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes, na.rm = TRUE),
    overall_avg_sleep = mean(TotalMinutesAsleep, na.rm = TRUE)
  )

print(overall_averages)

# --- Visualizations ---

# 1. Distribution of Daily Steps (Histogram & Boxplot)
ggplot(merged_data, aes(x = TotalSteps)) +
  geom_histogram(binwidth = 1000, fill = "#66c0ff", color = "black", alpha = 0.7) +
  geom_density(aes(y = after_stat(density)), color = "#005ab5", linewidth = 1.2) +
  labs(title = "Distribution of Daily Steps", x = "Total Steps", y = "Density") +
  theme_minimal()

ggplot(merged_data, aes(y = TotalSteps)) +
  geom_boxplot(fill = "#a7c957", color = "darkgreen") +
  labs(title = "Distribution of Daily Steps (Boxplot)", y = "Total Steps") +
  theme_bw()

# 2. Steps vs. Calories Burned
merged_data_for_correlation <- merged_data %>%
  filter(!is.na(TotalSteps), !is.na(Calories), is.finite(TotalSteps), is.finite(Calories))

ggplot(merged_data, aes(x = TotalSteps, y = Calories)) +  # Plot on the original data
  geom_point(alpha = 0.6, size = 2, aes(color = TotalDistance)) +
  geom_smooth(method = "lm", color = "#d62728", linewidth = 1.2, data = merged_data_for_correlation) + # Trendline on filtered data
  scale_color_viridis_c(option = "D") +
  labs(title = "Steps vs. Calories Burned", x = "Total Steps", y = "Calories Burned",
       subtitle = paste("Correlation:", round(cor(merged_data_for_correlation$TotalSteps, merged_data_for_correlation$Calories), 2))) + # Inline calculation
  theme_light()

# 3. Distribution of Sleep Time
merged_data_sleep_clean <- merged_data %>%
  filter(!is.na(TotalMinutesAsleep), is.finite(TotalMinutesAsleep))

ggplot(merged_data_sleep_clean, aes(x = TotalMinutesAsleep)) +
  geom_histogram(binwidth = 30, fill = "#f08080", color = "black", alpha = 0.7) +
  geom_density(aes(y = after_stat(density)), color = "#8b0000", linewidth = 1.2) + # Corrected!
  labs(title = "Distribution of Sleep Time", x = "Sleep Time (minutes)", y = "Density") +
  theme_minimal()

ggplot(merged_data_sleep_clean, aes(y = TotalMinutesAsleep)) + # Use the filtered data
  geom_boxplot(fill = "#add8e6", color = "darkblue") +
  labs(title = "Distribution of Sleep Time (Boxplot)", y = "Sleep Time (minutes)") +
  theme_bw()


# 4. Average Daily Activity Levels (Stacked Bar Chart)
activity_levels <- merged_data %>%
  summarize(
    avg_very_active = mean(VeryActiveMinutes, na.rm = TRUE),
    avg_fairly_active = mean(FairlyActiveMinutes, na.rm = TRUE),
    avg_lightly_active = mean(LightlyActiveMinutes, na.rm = TRUE),
    avg_sedentary = mean(SedentaryMinutes, na.rm = TRUE)
  )

activity_levels_long <- activity_levels %>%
  pivot_longer(cols = everything(), names_to = "Activity Type", values_to = "Minutes") %>%
  mutate(`Activity Type` = factor(`Activity Type`, levels = c("avg_sedentary", "avg_lightly_active", "avg_fairly_active", "avg_very_active")))

ggplot(activity_levels_long, aes(x = "", y = Minutes, fill = `Activity Type`)) +
  geom_col(color = "black", position = "fill") +
  geom_text(aes(label = paste0(round(Minutes / sum(Minutes) * 100, 1), "%")),
            position = position_fill(vjust = 0.5), color = "white") +
  labs(title = "Average Daily Activity Levels (Percentages)", y = "Percentage", fill = "Activity Type") +
  scale_fill_manual(values = c("#d8b365", "#f5f", "#5ab4ac", "#008837")) +
  theme_minimal()


activity_levels <- merged_data %>%
  summarize(
    avg_very_active = mean(VeryActiveMinutes, na.rm = TRUE),
    avg_fairly_active = mean(FairlyActiveMinutes, na.rm = TRUE),
    avg_lightly_active = mean(LightlyActiveMinutes, na.rm = TRUE),
    avg_sedentary = mean(SedentaryMinutes, na.rm = TRUE)
  )

# 5. Sleep vs. Total Activity
merged_data_sleep_total_activity <- merged_data %>%
  filter(!is.na(TotalMinutesAsleep), !is.na(VeryActiveMinutes), !is.na(FairlyActiveMinutes), !is.na(LightlyActiveMinutes), is.finite(TotalMinutesAsleep), is.finite(VeryActiveMinutes), is.finite(FairlyActiveMinutes), is.finite(LightlyActiveMinutes)) %>%
  mutate(TotalActiveMinutes = VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes) %>% # Create total activity
  select(TotalMinutesAsleep, TotalActiveMinutes, Calories) # Select needed columns


ggplot(merged_data_sleep_total_activity, aes(x = TotalMinutesAsleep, y = TotalActiveMinutes, color = Calories)) + # Use the new data & total activity
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", color = "#8e44ad", linewidth = 1.2) +
  scale_color_gradient(low = "#f0f0f0", high = "#c0392b") +
  labs(title = "Sleep Time vs. Total Active Minutes", x = "Sleep Time (minutes)", y = "Total Active Minutes", color = "Calories") +
  theme_bw()


# 6. Steps vs. Sedentary Minutes (Scatter Plot)
ggplot(merged_data, aes(x = TotalSteps, y = SedentaryMinutes, color = Calories)) +
  geom_point(alpha = 0.6, size = 2) +
  geom_smooth(method = "lm", color = "#2980b9", linewidth = 1.2) +
  scale_color_viridis_c(option = "C") +
  labs(title = "Steps vs. Sedentary Minutes", x = "Total Steps", y = "Sedentary Minutes", color = "Calories") +
  theme_bw()

# 7. Weekday vs. Weekend Activity (Boxplot)
merged_data$Weekday <- wday(merged_data$ActivityDate, label = TRUE)  # Add weekday column

ggplot(merged_data, aes(x = Weekday, y = TotalSteps)) +
  geom_boxplot(fill = "#f2c14e", color = "black") +
  labs(title = "Weekday vs. Weekend Activity", x = "Day of the Week", y = "Total Steps") +
  theme_bw()

# 8. Activity Level Distribution by Weekday/Weekend (Boxplot)
# Reshape the data for plotting
activity_by_day <- merged_data %>%
  select(Weekday, VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes) %>%
  pivot_longer(cols = c(VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes), 
               names_to = "ActivityType", values_to = "Minutes")

# Create the boxplot
ggplot(activity_by_day, aes(x = Weekday, y = Minutes, fill = ActivityType)) +
  geom_boxplot() +
  labs(title = "Activity Level Distribution by Weekday/Weekend",
       x = "Day of the Week", y = "Minutes", fill = "Activity Type") +
  scale_fill_manual(values = c("#d8b365", "#f5f", "#5ab4ac", "#008837")) + # Use same colors as before
  theme_bw()

# 9. Sleep Duration vs. Sedentary Minutes (Scatter Plot)
ggplot(merged_data, aes(x = TotalMinutesAsleep, y = SedentaryMinutes, color = Calories)) +
  geom_point(alpha = 0.6, size = 2) +
  geom_smooth(method = "lm", color = "#2980b9", linewidth = 1.2) +
  scale_color_viridis_c(option = "C") +
  labs(title = "Sleep Duration vs. Sedentary Minutes",
       x = "Total Minutes Asleep", y = "Sedentary Minutes", color = "Calories") +
  theme_bw()

# 10. Daily Steps vs. Sleep Duration (Scatter Plot)

ggplot(merged_data, aes(x = TotalSteps, y = TotalMinutesAsleep, color = Calories)) +
  geom_point(alpha = 0.6, size = 2) +
  geom_smooth(method = "lm", color = "#2980b9", linewidth = 1.2) +
  scale_color_viridis_c(option = "C") +
  labs(title = "Daily Steps vs. Sleep Duration",
       x = "Total Steps", y = "Total Minutes Asleep", color = "Calories") +
  theme_bw()