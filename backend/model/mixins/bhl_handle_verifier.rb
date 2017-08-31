module BHLHandleVerifier
  def before_save
    super
    non_hdl_handle_regex = /(?<!^https:\/\/hdl.handle\.net\/)2027\.42\/\d*$/
    if self.file_uri && non_hdl_handle_regex.match(self.file_uri.strip)
      handle = non_hdl_handle_regex.match(self.file_uri.strip)[0]
      self.file_uri = "https://hdl.handle.net/" + handle
    end
  end
end
