#Get Prices
symbols <- c("SPY","EFA", "IJS", "EEM","AGG")

head(getSymbols("SPY", src = 'yahoo',
           from = "2012-12-31",
           to = "2017-12-31",
           auto.assign = TRUE,
           warnings = FALSE))
prices <-
  getSymbols(symbols, src = 'yahoo',
             from = "2012-12-31",
             to = "2017-12-31",
             auto.assign = TRUE,
             warnings = FALSE) %>%
  map(~Ad(get(.))) %>%
  reduce(merge) %>%
  `colnames<-`(symbols)

AGG
#To Monthly Returns in the xts World
prices_monthly <- to.monthly(prices, indexAt = "lastof", OHLC = FALSE)

asset_returns_xts <- na.omit(Return.calculate(prices_monthly, method = "log"))
#To Monthly Returns in the tidyverse
asset_returns_dplyr_byhand <-
  prices %>%
  to.monthly(indexAt = "lastof", OHLC = FALSE) %>%
  # convert the index to a date
  data.frame(date = index(.)) %>%
  # now remove the index because it got converted to row names
  remove_rownames() %>%
  gather(asset, returns, -date) %>%
  group_by(asset) %>%
  mutate(returns = (log(returns) - log(lag(returns)))) %>%
  spread(asset, returns) %>%
  select(date, symbols) %>%
  na.omit()
#To Monthly Returns in the tidyquant World
asset_returns_tq_builtin <-
  prices %>%
  tk_tbl(preserve_index = TRUE,
         rename_index = "date") %>%
  gather(asset, prices, -date) %>%
  group_by(asset) %>%
  tq_transmute(mutate_fun = periodReturn,
               period = "monthly",
               type = "log") %>%
  spread(asset, monthly.returns) %>%
  select(date, symbols) %>%
  na.omit()
#To Monthly Returns using tibbletime
asset_returns_tbltime <-
  prices %>%
  to.monthly(indexAt = "lastof",
             OHLC = FALSE) %>%
  tk_tbl(preserve_index = TRUE,
         rename_index = "date") %>%
  # this is the the tibbletime function
  tbl_time(index = "date") %>%
  gather(asset, returns, -date) %>%
  group_by(asset) %>%
  tq_transmute(mutate_fun = periodReturn,
               type = "log") %>%
  spread(asset, monthly.returns) %>%
  select(date, symbols) %>%
  na.omit()
#Tidy Asset Returns
asset_returns_long <-
  asset_returns_dplyr_byhand %>%
  gather(asset, returns, -date)
#Portfolio Returns
w <- c(0.25,
       0.25,
       0.20,
       0.20,
       0.10)
#Portfolio Returns By-Hand
w_1 <- w[1]
w_2 <- w[2]
w_3 <- w[3]
w_4 <- w[4]
w_5 <- w[5]

asset1 <- asset_returns_xts[,1]
asset2 <- asset_returns_xts[,2]
asset3 <- asset_returns_xts[,3]
asset4 <- asset_returns_xts[,4]
asset5 <- asset_returns_xts[,5]

portfolio_returns_byhand <-
  (w_1 * asset1) +
  (w_2 * asset2) +
  (w_3 * asset3) +
  (w_4 * asset4) +
  (w_5 * asset5)

names(portfolio_returns_byhand) <- "returns"
#Portfolio Returns in the xts World
portfolio_returns_xts_rebalanced_monthly <-
  Return.portfolio(asset_returns_xts, weights = w, rebalance_on = "months") %>%
  `colnames<-`("returns")
#Portfolio Returns in the tidyverse
portfolio_returns_dplyr_byhand <-
  asset_returns_long %>%
  group_by(asset) %>%
  mutate(weights = case_when(asset == symbols[1] ~ w[1],
                             asset == symbols[2] ~ w[2],
                             asset == symbols[3] ~ w[3],
                             asset == symbols[4] ~ w[4],
                             asset == symbols[5] ~ w[5]),
         weighted_returns = returns * weights) %>%
  group_by(date) %>%
  summarise(returns = sum(weighted_returns))
#Portfolio Returns in the tidyquant World
portfolio_returns_tq_rebalanced_monthly <-
  asset_returns_long %>%
  tq_portfolio(assets_col  = asset,
               returns_col = returns,
               weights     = w,
               col_rename  = "returns",
               rebalance_on = "months")
