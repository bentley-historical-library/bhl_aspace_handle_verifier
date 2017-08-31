module BHLHandleVerifier
  def before_save
    super
    if self.file_uri && /2027\.42\/\d*/.match(self.file_uri) && !self.file_uri.start_with?("https://hdl.handle.net")
      handle = /2027\.42\/\d*/.match(self.file_uri)[0]
      self.file_uri = "https://hdl.handle.net/" + handle
    end
  end
end
