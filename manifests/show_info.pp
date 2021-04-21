#
class utilities::show_info(){
notify {"Running with facts.puppet_type ${::puppet_type} fact defined":}
notify {"The master used this time is ${::puppet_server} ":}
}