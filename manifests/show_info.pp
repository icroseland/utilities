#
class utilities::show_info(
  $eyaml_proof = "failed"
){
notify {"Running with facts.puppet_type ${::puppet_type} fact defined":}
notify {"The master used this time is ${::puppet_server} ":}
notify {"eyaml test ${eyaml_proof} ":}
}