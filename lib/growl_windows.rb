require 'growl'

module Growl
  @@path = nil

  def self.version
    @@path ||= self.path_from_registry
  end

  def self.path_from_registry
    require 'win32/registry'
    registry = Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\Classes\growl\DefaultIcon')
    registry[0].gsub('Growl.exe','growlnotify.exe')
  rescue Win32::Registry::Error => e
    puts "Find growl path from registry failed!\n You can use e.g. Grow.register_binpath('C:\Program Files\Growl for windows\growlnotify.exe') before notifying. "
    nil
  end

  def self.exec *args
    Kernel.system self.bin_path, *args
  end

  def self.bin_path= path
    @@path = path
  end

  def self.bin_path
    @@path
  end

  def self.register_binpath(path)
    @@path = path
  end

  class Base

    def self.switch_short switch, short
      @switchers_short ||= {}
      @switchers_short[switch] = short
    end

    def self.switches_short
      @switchers_short
    end

    def run
      raise Error, 'message required' unless message
      self.class.switches.each do |switch|
        if send(:"#{switch}?")
          tip = !self.class.switches_short[switch].nil? ? "/#{self.class.switches_short[switch]}:" : ""
          args << tip + send(switch).to_s if send(switch) && !(TrueClass === send(switch))
        end
      end
      Growl.exec *args
    end

    switch_short :title,     :t
    switch_short :message,   nil
    switch_short :sticky,    :s
    switch_short :name,      :a
    switch_short :appIcon,   :ai
    switch_short :icon,      :i
    switch_short :iconpath,  nil
    switch_short :image,     nil
    switch_short :priority,  :p
    switch_short :identifier,:id
    switch_short :host,      :host
    switch_short :password,  :pass
    switch_short :udp,       nil
    switch_short :port,      :port
    switch_short :auth,      nil
    switch_short :crypt,     nil
    switch_short :url,       :cu
  end

end
