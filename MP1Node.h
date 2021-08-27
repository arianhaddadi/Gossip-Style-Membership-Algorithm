/**********************************
 * FILE NAME: MP1Node.cpp
 *
 * DESCRIPTION: Membership protocol run by this Node.
 * 				Header file of MP1Node class.
 **********************************/

#ifndef _MP1NODE_H_
#define _MP1NODE_H_

#include "stdincludes.h"
#include "Log.h"
#include "Params.h"
#include "Member.h"
#include "EmulNet.h"
#include "Queue.h"
#include "sstream"

/**
 * Time Period Macros
 */
#define TREMOVE 5
#define TFAIL 5

/**
 * Message Type Macros
 */
#define JOINREQ '0'
#define JOINREP '1'
#define GOSSIP '2'

/**
 * CLASS NAME: MP1Node
 *
 * DESCRIPTION: Class implementing Membership protocol functionalities for failure detection
 */
class MP1Node {
private:
	EmulNet *emulNet;
	Log *log;
	Params *par;
	Member *memberNode;
	vector<MemberListEntry*> failedMembers;
	int num_failures;
	char NULLADDR[6];

public:
	MP1Node(Member *, Params *, EmulNet *, Log *, Address *);
	Member* getMemberNode() {
		return memberNode;
	}
	int recvLoop();
	void clear(char*, size_t);
	static int enqueueWrapper(void *env, char *buff, int size);
	void nodeStart(char *servaddrstr, short serverport);
	int initThisNode(Address *joinaddr);
	int introduceSelfToGroup(Address *joinAddress);
	void finishUpThisNode();
	void nodeLoop();
	void checkMessages();
	string getMembershipListString();
	vector<string> splitString(string str, char delim);
	int findFailedMember(MemberListEntry *member);
	MemberListEntry* getMemberListEntry(int id, int port);
	void sendMembershipList(string destination);
	void recvCallBack(void *env, char *data, int size);
	void nodeLoopOps();
	int isNullAddress(Address *addr);
	int findMemberListEntryIndex(MemberListEntry *mem);
	Address getJoinAddress();
	void initMemberListTable(Member *memberNode);
	void printAddress(Address *addr);
	virtual ~MP1Node();
};

#endif /* _MP1NODE_H_ */
