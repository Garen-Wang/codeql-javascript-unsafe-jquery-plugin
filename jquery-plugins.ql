import javascript
import semmle.javascript.dataflow.DataFlow

from DataFlow::SourceNode source_node
where jquery().getAPropertyRead("fn").getAPropertySource() = source_node
select source_node