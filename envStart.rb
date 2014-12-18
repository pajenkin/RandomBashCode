#! /usr/bin/env ruby
 
class Start
        def initialize(environment)
                        @environment = environment
        end

        def changeDir(inputDir)
                        Dir.chdir(inputDir)
        end
end
 
class Anon < Start
        def initialize(environment)
                        @environment = environment
                        @home = "#{ENV["HOME"]}"
                        @start = "gnome-terminal; ./start.sh &"
                        @kill = "gnome-terminal; ./kill.sh &"
                        @delphiHome = "#{@home}/main"
                        @dirStart = "#{@anonHome}/scripts"
                        @dirControlStart = "#{@anonHome}/html/controls"
                        @recoverPanel = "gnome-terminal; nohup gnome-panel  &"
                        #"gnome-terminal -t nohup gnome-panel > /dev/null 2>&1 &"
        end

        def runStart
                        puts "runStart " + @environment
                        changeDir @dirStart
                        system(@start)
                        changeDir @dirControlStart
                        system(@start)
                        exit 1
        end

        def kill
                        puts "kill " + @environment
                        changeDir @dirStart
                        system(@kill)
                        changeDir @dirControlStart
                        system(@kill)
                        exit 1
        end
 
end
 
class Panel < Start
        def initialize
                        @home = "#{ENV["HOME"]}"
                        @recoverPanel = "nohup gnome-panel > /dev/null 2>&1 &"
        end

        def openPanel
                        changeDir @home
                        system(@recoverPanel)
        end
end
 
env = ""
 
if ARGV[0] == "anon"
        env = Anon.new("anon")
        if ARGV[1] == "start"
                        env.runStart
        elsif ARGV[1] == "kill"
                        env.kill
        end
elsif
        env = Panel.new
        env.openPanel
        exit 1    
end










