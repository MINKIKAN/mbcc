package com.mbcc.util;



import java.time.LocalDate;
import java.time.LocalTime;

enum WorkDate{
    VACATION,WORK_DATE,DAYOFF;


    private LocalDate startDate;
    private LocalDate endDate;
    private LocalTime startTime;
    private LocalTime endTime;

   WorkDate(){}

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "WorkDate{" +
                "startDate=" + startDate +
                ", endDate=" + endDate +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }
}
public class test {
    public static void main(String[] args) {
        WorkDate date =  WorkDate.VACATION;
        date.setStartDate( LocalDate.now());
        date.setEndDate( date.getStartDate().plusDays(2));

        date.setStartTime(LocalTime.now());
        date.setEndTime(date.getStartTime().plusHours(2));

        System.out.println("date = " + date);
    }
}
 
