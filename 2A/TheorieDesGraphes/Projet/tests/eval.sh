ocamlc -I +ocamlgraph -I . -c DAG.ml
ocamlc -I +ocamlgraph -I . -c dag_test.ml 
ocamlc -I +ocamlgraph -I . -c testprojet.ml 
ocamlc -I +ocamlgraph -I . -c projet.ml 
ocamlc -I +ocamlgraph -I . -c result.ml 

if [ -f ./result ]; then
	rm ./result
fi

ocamlc -I +ocamlgraph -I . -o result graph.cma DAG.cmo dag_test.cmo projet.cmo testprojet.cmo result.cmo

./result | tee res.txt
