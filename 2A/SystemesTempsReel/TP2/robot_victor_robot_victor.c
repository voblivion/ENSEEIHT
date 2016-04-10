#include "tpl_os.h"
#include "nxt_motors.h"
#include "ecrobot_interface.h"
#include "ecrobot_private.h"	

FUNC(int, OS_APPL_CODE) main(void)
{   
    StartOS(OSDEFAULTAPPMODE);
    return 0;
}

DeclareTask(Task1);


typedef int _boolean;
typedef int _integer;
typedef char* _string;
typedef float _float;
typedef double _double;
#define _false 0
#define _true 1
typedef struct  {
   void* client_data;
   int current_state;
   _boolean _V0;
   _boolean _V1;
   _boolean _V2;
   _boolean _V3;
   _boolean _V4;
   _boolean _V5;
   _boolean _V6;
   _integer _V7;
   _boolean _V8;
   _boolean _V9;
   _boolean _V10;
   _integer _V11;
   _boolean _V12;
   _boolean _V13;
   _integer _V14;
   _boolean _V15;
   _boolean _V16;
   _integer _V17;
} robot_victor_ctx;
static void robot_victor_reset_input(robot_victor_ctx* ctx){
   ctx->_V0 = _false;
   ctx->_V0 = _false;
   ctx->_V0 = _false;
   ctx->_V0 = _false;
}
void robot_victor_reset(robot_victor_ctx* ctx){
   ctx->current_state = 0;
   ctx->_V5 = _true;
   robot_victor_reset_input(ctx);
}

static robot_victor_ctx the_ctx;

_integer speedA, speedB, speedC;

void robot_victor_O_Avant_A(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_A, speedA);}
void robot_victor_O_Avant_B(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_B, speedB);}
void robot_victor_O_Avant_C(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_C, speedC);}

void robot_victor_O_Arriere_A(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_A, -speedA);}
void robot_victor_O_Arriere_B(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_B, -speedB);}
void robot_victor_O_Arriere_C(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_C, -speedC);}

void robot_victor_O_Vitesse_A(void* cdata, _integer v)
      {speedA = v;}
void robot_victor_O_Vitesse_B(void* cdata, _integer v)
      {speedB = v;}
void robot_victor_O_Vitesse_C(void* cdata, _integer v)
      {speedC = v;}

void robot_victor_I_capteur_1(robot_victor_ctx* ctx, _boolean __V){
   ctx->_V1 = __V;
   ctx->_V0 = _true;
}
void robot_victor_I_capteur_2(robot_victor_ctx* ctx, _boolean __V){
   ctx->_V2 = __V;
   ctx->_V0 = _true;
}
void robot_victor_I_capteur_3(robot_victor_ctx* ctx, _boolean __V){
   ctx->_V3 = __V;
   ctx->_V0 = _true;
}
void robot_victor_I_capteur_4(robot_victor_ctx* ctx, _boolean __V){
   ctx->_V4 = __V;
   ctx->_V0 = _true;
}
void robot_victor_step(robot_victor_ctx* ctx){
   switch(ctx->current_state){
   case 0:
      ctx->_V11 = 100;
      robot_victor_O_Vitesse_A(ctx->client_data, ctx->_V11);
      ctx->_V12 = _false;
      robot_victor_O_Avant_B(ctx->client_data, ctx->_V12);
      ctx->_V13 = ctx->_V12;
      robot_victor_O_Arriere_B(ctx->client_data, ctx->_V13);
      ctx->_V14 = 0;
      robot_victor_O_Vitesse_B(ctx->client_data, ctx->_V14);
      ctx->_V7 = (ctx->_V5? ctx->_V14 : ((ctx->_V7 < 80)? (ctx->_V7 + 1) : 
ctx->_V14));
      ctx->_V6 = (ctx->_V5? ctx->_V12 : ((ctx->_V6 && (ctx->_V7 < 80))? _true
 : ctx->_V1));
      ctx->_V8 = (ctx->_V5? ctx->_V12 : ((ctx->_V8 && (ctx->_V7 < 80))? _true
 : ctx->_V4));
      ctx->_V10 = (ctx->_V5? ctx->_V12 : (((ctx->_V6 || ctx->_V8) && (ctx->_V7
 < 50))? _true : ((ctx->_V6 && (ctx->_V7 < 80))? _true : ctx->_V12)));
      robot_victor_O_Arriere_A(ctx->client_data, ctx->_V10);
      ctx->_V9 = (!ctx->_V10);
      robot_victor_O_Avant_A(ctx->client_data, ctx->_V9);
      ctx->_V16 = (ctx->_V5? ctx->_V12 : (((ctx->_V6 || ctx->_V8) && (ctx->_V7
 < 50))? _true : ((ctx->_V8 && (ctx->_V7 < 80))? _true : ctx->_V12)));
      robot_victor_O_Arriere_C(ctx->client_data, ctx->_V16);
      ctx->_V5 = _false;
      ctx->_V15 = (!ctx->_V16);
      robot_victor_O_Avant_C(ctx->client_data, ctx->_V15);
      ctx->_V17 = ctx->_V11;
      robot_victor_O_Vitesse_C(ctx->client_data, ctx->_V17);
      ctx->current_state = 0; break;
   break;
   } /* END SWITCH */
   robot_victor_reset_input(ctx);
}
TASK(TaskInitialize){
    robot_victor_reset(&the_ctx);

    TerminateTask();
}


TASK(Task1){

    if (ecrobot_get_touch_sensor(NXT_PORT_S1)==1)
        {robot_victor_I_capteur_1(&the_ctx, _true);}
    else
        {robot_victor_I_capteur_1(&the_ctx, _false);}

    if (ecrobot_get_touch_sensor(NXT_PORT_S2)==1)
       {robot_victor_I_capteur_2(&the_ctx, _true);}
    else
       {robot_victor_I_capteur_2(&the_ctx, _false);}

    if (ecrobot_get_touch_sensor(NXT_PORT_S3)==1)
       {robot_victor_I_capteur_3(&the_ctx, _true);}
    else
       {robot_victor_I_capteur_3(&the_ctx, _false);}

    if (ecrobot_get_touch_sensor(NXT_PORT_S4)==1)
       {robot_victor_I_capteur_4(&the_ctx, _true);}
    else
       {robot_victor_I_capteur_4(&the_ctx, _false);}

    robot_victor_step(&the_ctx);
    TerminateTask();
}

ISR(isr_button_start)
{
    ecrobot_status_monitor("isr_button_start");
    
}

ISR(isr_button_stop)
{
    ShutdownOS(E_OK);
}

ISR(isr_button_left)
{
    ecrobot_status_monitor("isr_button_left"); 

}

ISR(isr_button_right)
{
    ecrobot_status_monitor("isr_button_right");   

}

