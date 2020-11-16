/************************************************************/
/* Author	: Mahmoud Karam									*/
/* Date 	: 09/08/2020									*/
/* Version	: V1											*/
/************************************************************/

#include "STD_TYPES.h"
#include "BIT_MATH.h"

#include "AFIO_interface.h"
#include "AFIO_private.h"
#include "AFIO_config.h"

void MAFIO_voidSetEXTIConfiguration(u8 Copy_u8Line, u8 Copy_u8PortMap)
{
	u8 Local_u8RegIndex = 0;

	Copy_u8Line %= 4;
	Local_u8RegIndex = Copy_u8Line / 4;
		
	AFIO -> EXTICR[Local_u8RegIndex] &~= ((0b1111) << (Copy_u8Line * 4));
	AFIO -> EXTICR[Local_u8RegIndex]  |= (Copy_u8PortMap << (Copy_u8Line * 4));
}