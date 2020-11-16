/****************************************************************/
/* Author 	: Mahmoud Karam										*/
/* Date 	: 28/08/2020										*/
/* Version	: V1												*/
/****************************************************************/
#ifndef EXTI_PRIVATE_H
#define EXTI_PRIVATE_H

typedef struct
{
	volatile u32 IMR	;
	volatile u32 EMR	;
	volatile u32 RTSR	;
	volatile u32 FTSR	;
	volatile u32 SWIER	;
	volatile u32 PRR	;	
}EXTI_t;

#define 	EXTI	((volatile EXTI_t *)0x40010400)

#define 	Line0		0
#define 	Line1		1
#define 	Line2		2
#define 	Line3		3
#define 	Line4		4
#define 	Line5		5
#define 	Line6		6
#define 	Line7		7
#define 	Line8		8
#define 	Line9		9
#define 	Line10		10
#define 	Line11		11
#define 	Line12		12
#define 	Line13		13
#define 	Line14		14
#define 	Line15		15

#define		RISING		0
#define 	FALLING		1
#define		ON_CHANGE	2


#endif EXTI_PRIVATE_H