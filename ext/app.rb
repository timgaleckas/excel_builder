require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra'

post '/:filename.xlsx' do
  begin
    workbook = POI::Workbook.new("#{params[:filename]}.xlsx",nil)
    CommandRecorder.playback_from_json(params[:invocation_json],workbook)
    send_workbook(workbook)
  rescue Exception => e
    puts e.inspect
  end
end

def send_workbook(workbook)
  os = java.io.ByteArrayOutputStream.new
  workbook.instance_variable_get('@workbook').write(os)
  headers['Content-Type'] = "application/vnd.ms-excel"
  headers['Content-Disposition'] = 'attachment; filename="' + params[:filename] + '.xlsx"'
  headers['Cache-Control'] = ''
  String.from_java_bytes(os.toByteArray)
end
