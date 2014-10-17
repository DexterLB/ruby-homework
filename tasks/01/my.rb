require 'bigdecimal'

PHI = (BigDecimal(1) + Math.sqrt(5)) / 2
PSI = 1 - PHI

def series(series_name, n)
  case series_name
    when 'fibonacci'  then ((PHI**n - PSI**n) / Math.sqrt(5)).round
    when 'lucas'      then (PHI**(n - 1) + PSI**(n - 1)).round
    when 'summed'     then series('fibonacci', n) + series('lucas', n)
  end
end
