let inverse_ratio (p, q) = if p = 0 then failwith "0 non inversible" else (q, p);;
let add_ratio (a, b) (c, d) = (a*d + b*c, b*d);;
