script generation
generateLinuxScriptTest
	"Notify the user that real-time priority threads are required"
	"The VM generates the same warning if it can't change the thread priority.
	If this method is changed,
	https://github.com/pharo-project/pharo-vm/blob/master/opensmalltalk-vm/platforms/unix/vm/sqUnixHeartbeat.c
	beatStateMachine() should also be reviewed."
	super generateLinuxScriptTest.
	self 
		<<== 'REMEMBER ULIMITS REQUIREMENTS'
		<< 'echo "This VM uses a separate heartbeat thread to update its internal clock "'; cr;
		<< 'echo "and handle events.  For best operation, this thread should run at a "'; cr;
		<< 'echo "higher priority, however the VM was unable to change the priority.  The "'; cr;
		<< 'echo "effect is that heavily loaded systems may experience some latency issues."'; cr;
		<< 'echo "If this occurs the VM will output instructions on how to grant the VM"'; cr;
		<< 'echo "the required privileges to increase thread priority to stderr.  A script"'; cr;
		<< 'echo "called CONFIG is also available in the Pharo install directory."'; cr;
		<< 'echo "cat <<END | sudo tee /etc/security/limits.d/pharo.conf'; cr; 
		<< '*       hard    rtprio  2'; cr; 
		<< '*       soft    rtprio  2'; cr; 
		<< 'END" > ./CONFIG'; cr;
		<< 'chmod +x ./CONFIG'; cr;
		cr.