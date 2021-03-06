module AlertHelper
  include CableReady::Broadcaster
  def error(element, message)
    cable_ready[system_listen_channel].insert_adjacent_html(
      selector: element,
      position: 'afterbegin',
      html: render_to_string(partial: 'layouts/alert/message', locals: { message: message.html_safe, mode: 'alert-danger' })
    )
    cable_ready.broadcast
  end
end