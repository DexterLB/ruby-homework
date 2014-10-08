Phi = (1 + Math.sqrt(5))/2
Psi = 1 - Phi

def series(series_name, n)
  if series_name == 'fibonacci'
    return ((Phi**n - Psi**n)/Math.sqrt(5)).round
  elsif series_name == 'lucas'
    return (Phi**(n - 1) + Psi**(n - 1)).round
  end
  return series('fibonacci', n) + series('lucas', n)
end
