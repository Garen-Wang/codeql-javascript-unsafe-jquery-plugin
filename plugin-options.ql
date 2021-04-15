import javascript
import semmle.javascript.dataflow.DataFlow

from DataFlow::FunctionNode func_node, DataFlow::ParameterNode param_node
where
    jquery().getAPropertyRead("fn").getAPropertySource() = func_node and
    func_node.getLastParameter() = param_node
select func_node, param_node