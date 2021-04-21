#
class utilities::show_info(){
notify {"Running with facts.puppet_type ${::puppet_type} fact defined":}
notify {"THe master used this time is ${puppetmaster} ":}
}