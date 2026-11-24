% Student Performance Analysis

% 1. Marks of 8 students (Maths, Physics, Chemistry, English)
marks = [78 82 74 80;
    65 60 68 70;
    92 95 90 88;
    55 50 58 62;
    84 80 86 78;
    70 75 72 68;
    60 58 65 63;
    88 91 85 90];
attendance = [82 68 96 58 88 76 64 92];

% 2. Average marks of each student
averageMarks = mean(marks, 2);
disp('Average Marks of Students:');
disp(averageMarks);

% 3. Subject-wise average
subjectAverage = mean(marks);
disp('Subject-wise Average:');
disp(subjectAverage);

figure;
bar(subjectAverage);
xlabel('Subjects');
ylabel('Average Marks');
title('Subject-wise Average Marks');
grid on;

% 4. Statistics
disp('Mean:');
disp(mean(averageMarks));
disp('Median:');
disp(median(averageMarks));
disp('Mode:');
disp(mode(averageMarks));
disp('Range:');
disp(max(averageMarks) - min(averageMarks));
disp('Variance:');
disp(var(averageMarks));
disp('Standard Deviation:');
disp(std(averageMarks));

% 5. Correlation
r = corrcoef(attendance, averageMarks);
disp('Correlation:');
disp(r(1,2));

figure;
scatter(attendance, averageMarks, 'filled');
xlabel('Attendance (%)');
ylabel('Average Marks');
title('Attendance vs Average Marks');
grid on;

% 6. Linear Regression
p = polyfit(attendance, averageMarks', 1);
fitted = polyval(p, attendance);
disp('Slope and Intercept:');
disp(p);

figure;
scatter(attendance, averageMarks, 'filled');
hold on;
plot(attendance, fitted, 'g', 'LineWidth', 2);
xlabel('Attendance (%)');
ylabel('Average Marks');
title('Regression Line');
legend('Actual Marks', 'Fitted Line');
grid on;
hold off;

% Predicted marks for 75% attendance
disp('Predicted Marks for 75% Attendance:');
disp(polyval(p, 75));

% 7. T-Test: high attendance vs low attendance
highGroup = averageMarks(attendance >= 75);
lowGroup = averageMarks(attendance < 75);

[h, pValue] = ttest2(highGroup, lowGroup);
disp('T-Test Result:');
disp(h);
disp('P-Value:');
disp(pValue);

if h == 1
    disp('Significant difference between groups.');
else
    disp('No significant difference between groups.');
end

% 8. Final Report
disp('===== PERFORMANCE REPORT =====');
disp(['Class Average: ', num2str(mean(averageMarks))]);
disp(['Highest Marks: ', num2str(max(averageMarks))]);
disp(['Lowest Marks: ', num2str(min(averageMarks))]);
disp(['Average Attendance: ', num2str(mean(attendance))]);
disp('Project Completed Successfully!');