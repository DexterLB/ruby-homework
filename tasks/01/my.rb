require 'bigdecimal'

PHI = (BigDecimal('1') + Math.sqrt(5))/2
PSI = 1 - PHI

def series(series_name, n)
  if series_name == 'fibonacci'
    return ((PHI**n - PSI**n)/Math.sqrt(5)).round
  elsif series_name == 'lucas'
    return (PHI**(n - 1) + PSI**(n - 1)).round
  end
  series('fibonacci', n) + series('lucas', n)
end
