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
		<< 'echo "This VM uses a thread heartbeat to update the internal clock."'; cr; 
		<< 'echo "For best operation, this thread should run at real-time priority."'; cr;
		<< 'echo "If the VM is unable to operate at real-time priority the clock may"'; cr;
		<< 'echo "experience some jitter.  To avoid clock jitter, please'; cr;
		<< 'echo "remember to run ./CONFIG, logout and re-login once, before using Pharo."'; cr; 
		<< 'echo "cat <<END | sudo tee /etc/security/limits.d/pharo.conf'; cr; 
		<< '*       hard    rtprio  2'; cr; 
		<< '*       soft    rtprio  2'; cr; 
		<< 'END" > ./CONFIG'; cr;
		<< 'chmod +x ./CONFIG'; cr;
		cr.