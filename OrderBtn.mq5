//+------------------------------------------------------------------+
//|                                                     OrderBtn.mq5 |
//|                                                         BankiDev |
//|                                https://www.bankidev.netlify.app/ |
//+------------------------------------------------------------------+
#property copyright "BankiDev"
#property link      "https://www.bankidev.netlify.app/"
#property version   "1.00"

#include <Trade\Trade.mqh>
#include <Controls\Button.mqh>

#define BTN_BUY_NAME "Btn Buy"
#define BTN_SELL_NAME "Btn Sell"
#define BTN_CLOSE_NAME "Btn Close"

CButton btnBuy;
CButton btnSell;
CButton btnClose;

CTrade trade;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

      btnBuy.Create(0,BTN_BUY_NAME,0,50,50,200,80);
      btnBuy.Text("Buy");
      btnBuy.Color(clrWhite);
      btnBuy.ColorBackground(clrGreen);
      
      btnSell.Create(0,BTN_SELL_NAME,0,50,81,200,111);
      btnSell.Text("Sell");
      btnSell.Color(clrWhite);
      btnSell.ColorBackground(clrRed);
      
      btnClose.Create(0,BTN_CLOSE_NAME,0,50,112,200,142);
      btnClose.Text("Close");
      btnClose.Color(clrWhite);
      btnClose.ColorBackground(clrBlack);
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

   btnBuy.Destroy(reason);
   btnSell.Destroy(reason);
   btnClose.Destroy(reason);
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

      if(btnBuy.Pressed())
        {
         Print(__FUNCTION__, " > buy btn was pressed...");
         trade.Buy(0.1);
         btnBuy.Pressed(false); // Resetting the button to unpressed state
        }
        
      if(btnSell.Pressed())
        {
         Print(__FUNCTION__, " > sell btn was pressed...");
         trade.Sell(0.1);
         btnSell.Pressed(false); // Resetting the button to unpressed state
        }
        
      if(btnClose.Pressed())
        {
         Print(__FUNCTION__, " > close btn was pressed...");
         
         for(int i = PositionsTotal()-1; i >= 0; i--) {
         
            ulong posTicket = PositionGetTicket(i);      // Getting the ticket of open trades
            trade.PositionClose(posTicket);              // Closing position using tickets
         
         }
         
         btnClose.Pressed(false); // Resetting the button to unpressed state
        }
   
  }
//+------------------------------------------------------------------+
