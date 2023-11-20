void __libc_init_array(void) {};

int main(void)
{
    int i = 0;
    int j = 0;
    int k = 0;
    while (1) {
        i = i+1;
        j = i+1;
        k = j+1;
    }
}