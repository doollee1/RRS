    var treeModel = function ( _list, _rootId ) {
		
		var _treeModel = []; /* 최종적인 트리 데이터 */		
		var _listLength = _list.length;	/* 전체 데이터 길이 */		
		var _treeLength = 0; /* 트리 크기 */			
		var _loopLength = 0; /* 반복 횟수 */	
	
		/* 재귀 호출 */
		function getParentNode ( _children, item ) {
	
			/* 전체 리스트를 탐색 */
			for ( var i=0, child; child = _children[i]; i++ ) {
	
				/* 부모를 찾았으면, */
				if ( child.id === item.pId ) {
	
					var view =
					{
						"id" : item.id,
						"pId" : item.pId,
						"name" : item.name,
						"open" : item.open,
						"isParent" : item.isParent,
						"children" : []
					};	
					
					child.children.push(view); /* 현재 요소를 추가하고 */					
					_treeLength++; /* 트리 크기를 반영하고, */
					_list.splice( _list.indexOf( item ), 1 ); /* 데이터상에서는 삭제 */
	
					/* 현재 트리 계층을 정렬 */
					child.children.sort( function ( a, b ) { 
						return a.order < b.order ? -1 : a.order > b.order ? 1 : 0;  
					});
	
					break;
				}
	
				/* 부모가 아니면, */
				else {
					if( child.children.length ) {
						arguments.callee( child.children, item );
					}
				}
	
			}
		}
	
	
		/* 트리 변환 여부 + 무한 루프 방지 */
		while ( _treeLength != _listLength && _listLength != _loopLength++ ) {
	
			/* 전체 리스트를 탐색 */
			for ( var i=0, item; item = _list[i]; i++ ) {
	
				/* 최상위 객체면, */
				if ( item.pId === _rootId ) {
	
					var view =
					{
						"id" : item.id,
						"pId" : item.pId,
						"name" : item.name,
						"open" : item.open,
						"isParent" : item.isParent,
						"children" : []
					};	
					
					_treeModel.push(view); /* 현재 요소를 추가하고, */
					_treeLength++; /* 트리 크기를 반영하고, */					
					_list.splice(i, 1); /* 데이터상에서는 삭제 */
					
					_treeModel.sort( function ( a, b )/* 현재 트리 계층을 정렬 */
					{ 
						return a.order < b.order ? -1 : a.order > b.order ? 1 : 0;  
					});
	
					break;
				}	
				/* 하위 객체면, */
				else {				
					getParentNode( _treeModel, item );
				}
			}
		}
		return _treeModel;
	};