#define _exit()	asm("movl $1,%eax; xorl %ebx,%ebx; int $0x80");	/**< No return exit from function */

#define VGA_START	0xb8000

/**
 * Core entry point
 */
void _start(void)
{
	char* vga_buffer = (char*)VGA_START;

	vga_buffer[0] = 'H';
	vga_buffer[2] = 'e';
	vga_buffer[4] = 'l';
	vga_buffer[6] = 'l';
	vga_buffer[8] = 'o';
	
	while(1);

	_exit();
}
