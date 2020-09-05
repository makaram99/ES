/****************************************************************/
/* Author 	: Mahmoud Karam										*/
/* Date 	: 28/08/2020										*/
/* Version	: V1												*/
/****************************************************************/
#ifndef EXTI_INTERFACE_H
#define EXTI_INTERFACE_H

/* Line and mode	*/
void MEXTI_voidInit(u8 Copy_u8Line, u8 Copy_u8Mode);

void MEXTI_voidEnableEXTI (u8 Copy_u8Line);
void MEXTI_voidDisableEXTI(u8 Copy_u8Line);
void MEXTI_voidSwTrigger(u8 Copy_u8Line);

#endif EXTI_INTERFACE_H