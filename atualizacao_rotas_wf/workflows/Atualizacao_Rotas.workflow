{
	"contents": {
		"eac69f53-0251-4b4a-a160-9b5569665346": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "atualizacao_rotas",
			"subject": "Atualizacao_Rotas",
			"name": "Atualizacao_Rotas",
			"documentation": "Atualizacao de Rotas Workflow",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "Atualizacao_rota_request"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "End ( Approval )"
				},
				"6f060ddc-5a60-4894-9800-f3938e75896e": {
					"name": "End ( Rejection )"
				}
			},
			"activities": {
				"8f78fa80-c2e6-4d58-bbd5-e8dfaa8ce115": {
					"name": "RetrieveRotaData"
				},
				"232d5e99-6bc1-47ea-9501-b4cbe952aad2": {
					"name": "Approval required?"
				},
				"a73b2a66-6500-447e-98c4-61b2cd96eab5": {
					"name": "Manager_Approval"
				},
				"aa5312fe-65be-4108-ad7d-e4402f05aae4": {
					"name": "Handle Manager Approval"
				},
				"7f677c4b-a6cb-436c-adec-233e6e574c5e": {
					"name": "Approval Result?"
				},
				"84554b0b-6562-4ce7-8344-155b1fcd862a": {
					"name": "join"
				},
				"0386bc1c-918b-47b7-8bd6-7d3920d0be9b": {
					"name": "PreparaData"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"b2a10b3f-b6ee-4dd0-99d7-23c1320d4e6d": {
					"name": "SequenceFlow2"
				},
				"f572a1dd-4000-4b12-88de-e550298b3510": {
					"name": "yes"
				},
				"76924e46-696e-42a1-b122-58f481f7ce50": {
					"name": "SequenceFlow6"
				},
				"ec2c5137-0773-4671-bcb1-2a641b705215": {
					"name": "SequenceFlow7"
				},
				"aeab46c9-c30c-46c3-a8a8-5870f2bce129": {
					"name": "Yes"
				},
				"da52301e-7b3f-49ba-b3f9-46f8e327c8f2": {
					"name": "SequenceFlow9"
				},
				"189578c8-f10c-4435-b7a0-6e9c740e4272": {
					"name": "No"
				},
				"d7122f39-6826-4909-ba52-eef5fc615046": {
					"name": "No"
				},
				"8748cd96-1b74-4b61-988e-971c258a22a9": {
					"name": "SequenceFlow13"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Atualizacao_rota_request",
			"sampleContextRefs": {
				"12be12b1-cead-4593-ae28-9141d2edf707": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "End ( Approval )",
			"eventDefinitions": {
				"a004969a-e7d7-484c-b228-0262eb8d0afd": {}
			}
		},
		"6f060ddc-5a60-4894-9800-f3938e75896e": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent3",
			"name": "End ( Rejection )",
			"eventDefinitions": {
				"e3e447a0-ff13-4016-80cf-c90a4ac3256d": {}
			}
		},
		"8f78fa80-c2e6-4d58-bbd5-e8dfaa8ce115": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v2/rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.rulesPayload}",
			"responseVariable": "${context.approvalStepsResult}",
			"id": "servicetask1",
			"name": "RetrieveRotaData"
		},
		"232d5e99-6bc1-47ea-9501-b4cbe952aad2": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Approval required?",
			"default": "189578c8-f10c-4435-b7a0-6e9c740e4272"
		},
		"a73b2a66-6500-447e-98c4-61b2cd96eab5": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Aprovação de alteração de Rota ",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.approvalStepsResult.Result[0].Approvers.lm_userid}",
			"formReference": "/forms/Atualizacao_Rotas/AtualizacaoRotaApproval_00.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "atualizacaorotaapproval_00"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask1",
			"name": "Manager_Approval"
		},
		"aa5312fe-65be-4108-ad7d-e4402f05aae4": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/Atualizacao_Rotas/HandleApprovalManager.js",
			"id": "scripttask2",
			"name": "Handle Manager Approval"
		},
		"7f677c4b-a6cb-436c-adec-233e6e574c5e": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "Approval Result?",
			"default": "d7122f39-6826-4909-ba52-eef5fc615046"
		},
		"84554b0b-6562-4ce7-8344-155b1fcd862a": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway3",
			"name": "join"
		},
		"0386bc1c-918b-47b7-8bd6-7d3920d0be9b": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/Atualizacao_Rotas/PrepareData.js",
			"id": "scripttask3",
			"name": "PreparaData"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "0386bc1c-918b-47b7-8bd6-7d3920d0be9b"
		},
		"b2a10b3f-b6ee-4dd0-99d7-23c1320d4e6d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "8f78fa80-c2e6-4d58-bbd5-e8dfaa8ce115",
			"targetRef": "232d5e99-6bc1-47ea-9501-b4cbe952aad2"
		},
		"f572a1dd-4000-4b12-88de-e550298b3510": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.Rota.ExecuteApproval}",
			"id": "sequenceflow5",
			"name": "yes",
			"sourceRef": "232d5e99-6bc1-47ea-9501-b4cbe952aad2",
			"targetRef": "a73b2a66-6500-447e-98c4-61b2cd96eab5"
		},
		"76924e46-696e-42a1-b122-58f481f7ce50": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "a73b2a66-6500-447e-98c4-61b2cd96eab5",
			"targetRef": "aa5312fe-65be-4108-ad7d-e4402f05aae4"
		},
		"ec2c5137-0773-4671-bcb1-2a641b705215": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "aa5312fe-65be-4108-ad7d-e4402f05aae4",
			"targetRef": "7f677c4b-a6cb-436c-adec-233e6e574c5e"
		},
		"aeab46c9-c30c-46c3-a8a8-5870f2bce129": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.decision == \"approve\"}",
			"id": "sequenceflow8",
			"name": "Yes",
			"sourceRef": "7f677c4b-a6cb-436c-adec-233e6e574c5e",
			"targetRef": "84554b0b-6562-4ce7-8344-155b1fcd862a"
		},
		"da52301e-7b3f-49ba-b3f9-46f8e327c8f2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "84554b0b-6562-4ce7-8344-155b1fcd862a",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"189578c8-f10c-4435-b7a0-6e9c740e4272": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "No",
			"sourceRef": "232d5e99-6bc1-47ea-9501-b4cbe952aad2",
			"targetRef": "84554b0b-6562-4ce7-8344-155b1fcd862a"
		},
		"d7122f39-6826-4909-ba52-eef5fc615046": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "No",
			"sourceRef": "7f677c4b-a6cb-436c-adec-233e6e574c5e",
			"targetRef": "6f060ddc-5a60-4894-9800-f3938e75896e"
		},
		"8748cd96-1b74-4b61-988e-971c258a22a9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "0386bc1c-918b-47b7-8bd6-7d3920d0be9b",
			"targetRef": "8f78fa80-c2e6-4d58-bbd5-e8dfaa8ce115"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"026abb80-b07a-4213-8385-f51cca7ac59c": {},
				"0d19d918-16ec-4eb5-bbad-84002523e0f4": {},
				"5fedade3-9628-41d5-922f-416aabac1cf4": {},
				"bbb94b5a-526b-498e-8a14-9491d69b226a": {},
				"ce6e5b7a-a845-4d95-a2e5-f469d14287f6": {},
				"06b66413-36d8-4f75-96de-f976bdea7ff0": {},
				"e0f87ee0-9522-409e-9871-8c428f0eae28": {},
				"9a8923c5-6f62-4f78-910b-0c2a0eeb274a": {},
				"827201e9-42dd-4520-b924-4bd0b9a563e0": {},
				"4c7aed7f-cc7c-4516-bb81-612cb6c0b0cd": {},
				"7124f9c0-8492-4e9c-8af9-23bbafe8e227": {},
				"ec0aa869-50fc-4e67-b56b-ab2414e43e75": {},
				"9da9cef9-d1c2-484c-abb7-a113f814d80d": {},
				"d003b481-b143-442a-9e70-523409d304d3": {},
				"294ee9c6-7c82-4f96-9149-b2ad9665af38": {},
				"224809e1-2adf-4dbe-92b1-0580910c479d": {},
				"e7ba49de-d621-47e1-8eaf-7168d3467184": {}
			}
		},
		"12be12b1-cead-4593-ae28-9141d2edf707": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/Atualizacao_Rotas/Atualizao_rota_start_payload.json",
			"id": "default-start-context"
		},
		"a004969a-e7d7-484c-b228-0262eb8d0afd": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition3"
		},
		"e3e447a0-ff13-4016-80cf-c90a4ac3256d": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition2"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 63.999999701976776,
			"y": 12,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 132.49999970197678,
			"y": 771.9999952316284,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,44 79.99999970197678,94",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "224809e1-2adf-4dbe-92b1-0580910c479d",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"026abb80-b07a-4213-8385-f51cca7ac59c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 29.999999701976776,
			"y": 204,
			"width": 100,
			"height": 60,
			"object": "8f78fa80-c2e6-4d58-bbd5-e8dfaa8ce115"
		},
		"0d19d918-16ec-4eb5-bbad-84002523e0f4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,264 79.99999970197678,314",
			"sourceSymbol": "026abb80-b07a-4213-8385-f51cca7ac59c",
			"targetSymbol": "5fedade3-9628-41d5-922f-416aabac1cf4",
			"object": "b2a10b3f-b6ee-4dd0-99d7-23c1320d4e6d"
		},
		"5fedade3-9628-41d5-922f-416aabac1cf4": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 58.999999701976776,
			"y": 314,
			"object": "232d5e99-6bc1-47ea-9501-b4cbe952aad2"
		},
		"bbb94b5a-526b-498e-8a14-9491d69b226a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,356 80,386.5 -11,386.5 -11,416.9999988079071",
			"sourceSymbol": "5fedade3-9628-41d5-922f-416aabac1cf4",
			"targetSymbol": "ce6e5b7a-a845-4d95-a2e5-f469d14287f6",
			"object": "f572a1dd-4000-4b12-88de-e550298b3510"
		},
		"ce6e5b7a-a845-4d95-a2e5-f469d14287f6": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": -61,
			"y": 416.9999988079071,
			"width": 100,
			"height": 60,
			"object": "a73b2a66-6500-447e-98c4-61b2cd96eab5"
		},
		"06b66413-36d8-4f75-96de-f976bdea7ff0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-11,476.9999988079071 -11,540.9999988079071",
			"sourceSymbol": "ce6e5b7a-a845-4d95-a2e5-f469d14287f6",
			"targetSymbol": "e0f87ee0-9522-409e-9871-8c428f0eae28",
			"object": "76924e46-696e-42a1-b122-58f481f7ce50"
		},
		"e0f87ee0-9522-409e-9871-8c428f0eae28": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -61,
			"y": 540.9999988079071,
			"width": 100,
			"height": 60,
			"object": "aa5312fe-65be-4108-ad7d-e4402f05aae4"
		},
		"9a8923c5-6f62-4f78-910b-0c2a0eeb274a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-8,600.9999988079071 -8,665.9999976158142",
			"sourceSymbol": "e0f87ee0-9522-409e-9871-8c428f0eae28",
			"targetSymbol": "827201e9-42dd-4520-b924-4bd0b9a563e0",
			"object": "ec2c5137-0773-4671-bcb1-2a641b705215"
		},
		"827201e9-42dd-4520-b924-4bd0b9a563e0": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": -26,
			"y": 665.9999976158142,
			"object": "7f677c4b-a6cb-436c-adec-233e6e574c5e"
		},
		"4c7aed7f-cc7c-4516-bb81-612cb6c0b0cd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-5,690 150.5,690",
			"sourceSymbol": "827201e9-42dd-4520-b924-4bd0b9a563e0",
			"targetSymbol": "7124f9c0-8492-4e9c-8af9-23bbafe8e227",
			"object": "aeab46c9-c30c-46c3-a8a8-5870f2bce129"
		},
		"7124f9c0-8492-4e9c-8af9-23bbafe8e227": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 129.49999970197678,
			"y": 665.9999964237213,
			"object": "84554b0b-6562-4ce7-8344-155b1fcd862a"
		},
		"ec0aa869-50fc-4e67-b56b-ab2414e43e75": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "150.24999970197678,707.9999964237213 150.24999970197678,771.9999952316284",
			"sourceSymbol": "7124f9c0-8492-4e9c-8af9-23bbafe8e227",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "da52301e-7b3f-49ba-b3f9-46f8e327c8f2"
		},
		"9da9cef9-d1c2-484c-abb7-a113f814d80d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,356 150.5,356 150.49999970197678,665.9999964237213",
			"sourceSymbol": "5fedade3-9628-41d5-922f-416aabac1cf4",
			"targetSymbol": "7124f9c0-8492-4e9c-8af9-23bbafe8e227",
			"object": "189578c8-f10c-4435-b7a0-6e9c740e4272"
		},
		"d003b481-b143-442a-9e70-523409d304d3": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": -25.500000298023224,
			"y": 771.9999964237213,
			"width": 35,
			"height": 35,
			"object": "6f060ddc-5a60-4894-9800-f3938e75896e"
		},
		"294ee9c6-7c82-4f96-9149-b2ad9665af38": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-6.500000149011612,707.9999976158142 -6.500000149011612,771.9999964237213",
			"sourceSymbol": "827201e9-42dd-4520-b924-4bd0b9a563e0",
			"targetSymbol": "d003b481-b143-442a-9e70-523409d304d3",
			"object": "d7122f39-6826-4909-ba52-eef5fc615046"
		},
		"224809e1-2adf-4dbe-92b1-0580910c479d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 29.999999701976776,
			"y": 94,
			"width": 100,
			"height": 60,
			"object": "0386bc1c-918b-47b7-8bd6-7d3920d0be9b"
		},
		"e7ba49de-d621-47e1-8eaf-7168d3467184": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,154 79.99999970197678,204",
			"sourceSymbol": "224809e1-2adf-4dbe-92b1-0580910c479d",
			"targetSymbol": "026abb80-b07a-4213-8385-f51cca7ac59c",
			"object": "8748cd96-1b74-4b61-988e-971c258a22a9"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 3,
			"sequenceflow": 13,
			"startevent": 1,
			"endevent": 3,
			"usertask": 2,
			"servicetask": 2,
			"scripttask": 3,
			"exclusivegateway": 3
		}
	}
}