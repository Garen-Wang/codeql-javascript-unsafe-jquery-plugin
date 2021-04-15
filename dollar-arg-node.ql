import javascript
import semmle.javascript.dataflow.DataFlow

from DataFlow::Node expr
where jquery().getACall().getArgument(0) = expr
select expr