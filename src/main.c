#define _exit()	asm("movl $1,%eax; xorl %ebx,%ebx; int $0x80");	/**< No return exit from function */

/**
 * Core entry point
 */
void _start(void)
{
	_exit();
}
