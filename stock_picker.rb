def stock_picker(stocks)
  difference = 0 #differenza di guadagno
  previous_stock = 0 #stock precedente
  buy = 0
  buyidx = 0
  realbuy = 0
  realsell = 0
  stocks.map.with_index { |stock, idx|
    if stock < buy || idx == 0
      buy = stock #se lo stock attuale è minore del precedente, o minore di quello salvato in buy, mettilo in una variabile
      buyidx = idx
    end
    if (stock - buy) > difference && buy != 0
      difference = stock - buy #se la differenza tra lo stock attuale e quello di compra potenziale è più alto dell'attuale in difference, sostituiscilo a difference
      realsell = idx
      realbuy = buyidx #salva i due numeri attuali in due variabili che poi saranno riportate dal method
    end
    previous_stock = stock #salva lo stock attuale per compararlo al successivo
  }
  return [realbuy, realsell]
end

puts stock_picker([3,2,6,9,15,8,6,17,1])