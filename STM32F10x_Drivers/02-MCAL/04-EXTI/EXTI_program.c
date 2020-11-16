/****************************************************************/
/* Author 	: Mahmoud Karam										*/
/* Date 	: 28/08/2020										*/
/* Version	: V1												*/
/****************************************************************/
#include "STD_TYPES.h"
#include "BIT_MATH.h"

#include "EXTI_interface.h"
#include "EXTI_config.h"
#include "EXTI_private.h"

static void (* EXTI0_callback)	(void) = NULL;

/* Line and Mode	*/
void MEXTI_voidInit(u8 Copy_u8Line, u8 Copy_u8Mode)
{
	#if		EXTI_MODE	==	RISING
		SET_BIT(EXTI -> RTSR, EXTI_LINE);
	#elif 	EXTI_MODE	== 	FALLING
		SET_BIT(EXTI -> FTSR, EXTI_LINE);
	#elif 	EXTI_MODE	== 	ON_CHANGE
		SET_BIT(EXTI -> FTSR, EXTI_LINE);
		SET_BIT(EXTI -> RTSR, EXTI_LINE);
	#else 	#error	"Wrong Mode and Line"
	#endif
	
	/* Disable Interrupt	*/
	CLR_BIT(EXTI -> IMR, Copy_u8Line);
}

void MEXTI_voidEnableEXTI (u8 Copy_u8Line)
{
	SET_BIT(EXTI -> IMR, Copy_u8Line);
}

void MEXTI_voidDisableEXTI(u8 Copy_u8Line)
{
	CLR_BIT(EXTI -> IMR, Copy_u8Line);
}

void MEXTI_voidSwTrigger(u8 Copy_u8Line)
{
	SET_BIT(EXTI -> SWIER, Copy_u8Line);
}

void MEXTI_voidSetSingleLatch(u8 Copy_u8Line, u8 Copy_u8Mode)
{
	switch (Copy_u8Mode)
	{
		case RISING		:	SET_BIT(EXTI -> RTSR, EXTI_Line);	break;
		case FALLING	:	SET_BIT(EXTI -> FTSR, EXTI_Line);	break;
		case ON_CHANGE	:	SET_BIT(EXTI -> RTSR, EXTI_Line);	break;
							SET_BIT(EXTI -> FTSR, EXTI_Line);	break;
	}
}

void EXTI0_IRQHandler (void)
{
	EXTI0_callback();
	/* Clear pending bit	*/
	SET_BIT(EXTI -> PR, 0);
}

void MEXTI_voidSetCallBack	(void (*ptr) (void))
{
	EXTI0_callback = ptr;
}

