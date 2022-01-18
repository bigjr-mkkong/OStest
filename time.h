#ifndef __TIME_H__
#define __TIME_H__

struct time{
    int sec;
    int min;
    int hour;
    int day;
    int month;
    int year;
};

void get_cmos_time(struct time *t);
struct time t;

#endif