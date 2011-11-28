require 'curb'
require 'configliere'
module ElVfsClient
  class ElFinderController < ApplicationController
    respond_to :json, :html

    def run
      params.delete(:format)
      params.delete(:controller)
      params.delete(:action)
      c = Curl::Easy.new("#{Settings[:el_vfs][:protocol]}://#{Settings[:el_vfs][:host]}:#{Settings[:el_vfs][:port]}/el_vfs/api/elfinder") do |curl|
        curl.headers['User-Agent'] = request.user_agent
        curl.headers['Accept'] = 'application/json'
        curl.headers['CLIENT_IP'] = request.env['HTTP_CLIENT_IP']
        curl.headers['X_FORWARDED_FOR'] = request.env['HTTP_X_FORWARDED_FOR']
        curl.headers['REMOTE_ADDR'] = request.env['REMOTE_ADDR']
        curl.multipart_form_post = true
      end

      if params['cmd'] == 'upload'
        upload = params.delete(:upload)
        parameters = params.map{ |key, value| Curl::PostField.content(key, value)}
        files = upload.map{ |file| Curl::PostField.file('upload[]', file.path, file.original_filename) }
        c.http_post(*parameters, *files)
      else
        c.url << "?#{params.to_query}"
        c.http_get
      end

      respond_to do |format|
        format.html { render :json => c.body_str }
        format.json { render :json => c.body_str }
      end
    end
  end
end
