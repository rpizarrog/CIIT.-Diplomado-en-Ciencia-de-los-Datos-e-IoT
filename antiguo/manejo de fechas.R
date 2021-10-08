# Manejo de fechas

library(lubridate)

today()   # Fecha de hoy yyyy-mm-dd

now()  # Fecha con hora

today() + 8   # Agregando dias a la fecha de hoy


ymd("1969-11-06")

mdy("1969-11-06")  # No funciona

ymd(19691106)

mdy(19691106)  # No funciona

ymd_hms("2017-01-31 20:11:59")

mdy_hm("01/31/2017 08:01")

ymd(20170131, tz = )


# Crear fechas

mifecha <- make_date(year = 1969, month = 11, day = 6)
mifecha

# Partir las fechas

year(x = today())

year(x = mifecha)

month(mifecha)

day(mifecha)

quarter(mifecha)

wday(mifecha)  # dia de la semana


weekdays(today())   # Pauete base

weekdays(mifecha)   # Dia en que nací
































