import javascript

// from DataFlow::FunctionNode func_node, DataFlow::ParameterNode param_node
// where
//     jquery().getAPropertyRead("fn").getAPropertySource() = func_node and
//     func_node.getLastParameter() = param_node
// select func_node, param_node

predicate isSource(DataFlow::Node source) {
    exists(DataFlow::FunctionNode func_node |
        jquery().getAPropertyRead("fn").getAPropertySource() = func_node and
        func_node.getLastParameter() = source
    )
}

from DataFlow::Node node
where isSource(node)
select node