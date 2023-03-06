#ifndef LED_H_
#define LED_H_

#ifndef ASSEMBLY

typedef enum led_on_off
{
    TURN_ON = 0x0,
    TURN_OFF
}led_on_off_t;

typedef enum led_index
{
    LED_R = 0x0U,
    LED_G,
    LED_B,
    LED_ALL
}led_index_t;

void led_init(void);
void led_trigger(const led_index_t index, const led_on_off_t on_off);
void led_reback(const led_index_t index);

#endif /* ASSEMBLY */

#endif /* LED_H_ */