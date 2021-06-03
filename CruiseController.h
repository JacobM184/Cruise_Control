#ifndef CRUISECONTROLLER_DATA_H
#define CRUISECONTROLLER_DATA_H

#include <stdbool.h>

float saturateThrottle(float, bool*);
float regulateThrottle(int, float, float);

#endif