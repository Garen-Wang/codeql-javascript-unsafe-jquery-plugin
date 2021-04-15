/**
 * @name xss
 * @kind path-problem
 * @id js/xss-unsafe-plugin
 */

 import javascript
 import DataFlow::PathGraph

 class Config extends TaintTracking::Configuration {
    Config() {
        this = "config"
    }

    override predicate isSource(DataFlow::Node source) {
        exists(DataFlow::FunctionNode func_node |
            jquery().getAPropertyRead("fn").getAPropertySource() = func_node and
            func_node.getLastParameter() = source
        )
    }
    override predicate isSink(DataFlow::Node sink) {
        jquery().getACall().getArgument(0) = sink
    }
 }

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Potential XSS vulnerability in plugin."