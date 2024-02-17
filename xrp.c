#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define RESET   "\033[0m"
#define BLACK   "\033[30m"      /* Black */
#define RED     "\033[31m"      /* Red */
#define GREEN   "\033[32m"      /* Green */
#define YELLOW  "\033[33m"      /* Yellow */
#define BLUE    "\033[34m"      /* Blue */
#define MAGENTA "\033[35m"      /* Magenta */
#define CYAN    "\033[36m"      /* Cyan */
#define WHITE   "\033[37m"      /* White */
#define BOLDBLACK   "\033[1m\033[30m"      /* Bold Black */
#define BOLDRED     "\033[1m\033[31m"      /* Bold Red */
#define BOLDGREEN   "\033[1m\033[32m"      /* Bold Green */
#define BOLDYELLOW  "\033[1m\033[33m"      /* Bold Yellow */
#define BOLDBLUE    "\033[1m\033[34m"      /* Bold Blue */
#define BOLDMAGENTA "\033[1m\033[35m"      /* Bold Magenta */
#define BOLDCYAN    "\033[1m\033[36m"      /* Bold Cyan */
#define BOLDWHITE   "\033[1m\033[37m"      /* Bold White */

#define EURO "\xE2\x82\xAC\n" // Euro sign


int main(int argc, char *argv[])
{
    int arg_cnt=0;
    for(int i=1; i<argc; i++) 
    {
        arg_cnt++;
    }
    printf(BOLDBLACK "ARGS: %d\n" RESET , arg_cnt);



    if (arg_cnt == 2) 
    {
    float qt = atof(argv[1]);
    float p_sell = atof(argv[2]);

    printf("Quantity:\t%f\n", qt);
    printf("Price Sell:\t%f" EURO, p_sell);
    printf(BOLDGREEN "Total Price:\t%.2f" EURO RESET, (qt*p_sell) - (qt*0.0005) );


    } else if (arg_cnt == 3)
    {
        float qt = atof(argv[1]);
        float p_buy = atof(argv[2]);
        float p_sell = atof(argv[3]);
    

        printf("Quantity:\t%.4f\n", qt);
        printf("Price Buy:\t%.4f" EURO, p_buy);
        printf("Price Sell:\t%.4f" EURO, p_sell);
        printf("Total Price:\t%.2f"EURO, (qt*p_sell) - (qt*0.0005) );
        float profit_euro = (qt*p_sell)-(qt*p_buy)-(2*qt*0.0005);
        float profit_xrp = profit_euro/p_buy;
        printf(BOLDGREEN "PROFIT XRP:\t%.2f\n"RESET, profit_xrp);
        printf( BOLDGREEN "PROFIT PRICE:\t%.2f"EURO RESET, profit_euro);


    } else 
    {
       printf(RED "Error - Invvalid number of argumets!\n" RESET);
       printf("Suggestion: xrp <quantity> <price sell>\n");
       printf("Suggestion: xrp <quantity> <buy sell> <sell price>\n");
    }


    return 0;
} 
