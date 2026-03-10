#define RCC_AHB1ENR   (*(volatile unsigned int*)0x40023830)
#define GPIOA_MODER   (*(volatile unsigned int*)0x40020000)
#define GPIOA_ODR     (*(volatile unsigned int*)0x40020014)

void delay()
{
    for(volatile int i=0;i<50000;i++);
}

int main()
{
    RCC_AHB1ENR |= (1<<0);

    GPIOA_MODER &= ~(3<<10);
    GPIOA_MODER |=  (1<<10);

    while(1)
    {
        GPIOA_ODR ^= (1<<5);
        delay();
    }
}