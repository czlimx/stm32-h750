
unsigned int array_data[32] = {5};
unsigned int array_bss[32];
int main(void)
{

    for (int i = 0; i < 32; i++)
    {
        array_data[i] = i;
    }

    return 0;
}