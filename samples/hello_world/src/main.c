/*
 * Copyright (c) 2012-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <stdio.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(main);

#define MAIN_BSACIC_COUNT 1000
int endc = 0;

int main(void)
{
	LOG_INF("Hello World!.s (main.s=%d) %s", endc++, CONFIG_BOARD_TARGET);
	LOG_INF("Hello World!.s (main.s=%d) %s", endc++, CONFIG_BOARD_TARGET); //printf
	printk("Hello World! %s\n\n", CONFIG_BOARD_TARGET);

	return 0;
}
