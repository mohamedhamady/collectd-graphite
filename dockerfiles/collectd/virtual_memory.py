import collectd
import psutil

def configer(cfg):
    """Configure"""
    collectd.debug('Configuring stuff with: key = %s' %(cfg.values))
    for child in cfg.children:
        collectd.debug('Configuring params name = %s, value = %s' %(child.key, str(child.values)))

def initer():
    """Initer"""
    collectd.debug('Initializing stuff ...')

def dispatch_value(value_type, value):
    if not value:
        return

    metric = collectd.Values()
    metric.plugin = 'virtual_memory'
    metric.type = 'virtual_memory'
    metric.type_instance = value_type
    metric.values = [value]
    metric.dispatch()

def reader(input_data=None):
    """Read data and dispatch"""
    memories = psutil.virtual_memory()
    for key in ['total', 'available', 'percent', 'used', 'active', 'inactive', 'buffers', 'cached', 'shared']:
        dispatch_value(key, getattr(memories, key))

collectd.register_config(configer)
collectd.register_init(initer)
collectd.register_read(reader)
