import javascript
import semmle.javascript.dataflow.DataFlow

from DataFlow::Node node
where jquery().getAPropertyRead("fn") = node
select node