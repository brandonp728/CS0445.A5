package cs445.a5;

import java.util.Iterator;
import java.util.NoSuchElementException;
import StackAndQueuePackage.LinkedQueue;
import StackAndQueuePackage.LinkedStack;
import StackAndQueuePackage.StackInterface;

public class TernaryTree<T> implements TernaryTreeInterface<T> {
	TernaryNode<T> rootNode;
	
	public TernaryTree()
	{
		rootNode=null;
	}
	
	public TernaryTree(T rootData)
	{
		rootNode = new TernaryNode<>(rootData);
	}
	
	public TernaryTree(T rootData, TernaryTree<T> leftTree, TernaryTree<T> middleTree,
			TernaryTree<T> rightTree)
	{
		privateSetTernaryTree(rootData, (TernaryTree<T>)leftTree, (TernaryTree<T>)middleTree, (TernaryTree<T>)rightTree);
	}
	
	public void setTree(T rootData)
	{
		rootNode = new TernaryNode<>(rootData);
	}
	
	@Override
	public void setTree(T rootData, TernaryTreeInterface<T> leftTree, TernaryTreeInterface<T> middleTree,
			TernaryTreeInterface<T> rightTree) {
			privateSetTernaryTree(rootData, (TernaryTree<T>)leftTree, (TernaryTree<T>)middleTree, (TernaryTree<T>)rightTree);
	}

	private void privateSetTernaryTree(T rootData, TernaryTree<T> leftTree, TernaryTree<T> middleTree,
			TernaryTree<T> rightTree)
	{
		rootNode = new TernaryNode<>(rootData);
		
		if((leftTree!=null) && !leftTree.isEmpty())
		{
			rootNode.setLeftChild(leftTree.rootNode);
		}
		
		if((middleTree!=null) && !middleTree.isEmpty())
		{
			if(middleTree!=leftTree)
			{
				rootNode.setMiddleChild(middleTree.rootNode);
			}
			else
			{
				rootNode.setMiddleChild(middleTree.rootNode.copy());
			}
		}
		
		if((rightTree!=null) && !rightTree.isEmpty())
		{
			if(rightTree!=middleTree)
			{
				rootNode.setRightChild(rightTree.rootNode);
			}
			else
			{
				rootNode.setRightChild(rightTree.rootNode.copy());
			}
		}
		
		if ((leftTree != null) && (leftTree != this)) {
	            leftTree.clear();
	    }
		 
		if ((middleTree != null) && (middleTree != this)) {
	            middleTree.clear();
	    }

	    if ((rightTree != null) && (rightTree != this)) {
	            rightTree.clear();
	    }
	}
	
	@Override
	public T getRootData() {
		if(isEmpty())
		{
			throw new EmptyTreeException();
		}
		else
		{
			return rootNode.getData();
		}
	}

	@Override
	public int getHeight() {
		return rootNode.getHeight();
	}

	@Override
	public int getNumberOfNodes() {
		return rootNode.getNumberOfNodes();
	}

	@Override
	public boolean isEmpty() {
		return (rootNode==null);
	}

	@Override
	public void clear() {
		rootNode = null;
	}

	@Override
	public Iterator<T> getPreorderIterator() {
		return new PreorderIterator();
	}

	@Override
	public Iterator getPostorderIterator() {
		return new PostorderIterator();
	}

	@Override
	/*
	 * Not included in this ADT. Due the middle child's inclusion,
	 * getting the items inOrder does not work as the middle
	 * child will replace the root data in the output.
	 */
	public Iterator getInorderIterator() {
		throw new UnsupportedOperationException();
	}

	@Override
	public Iterator getLevelOrderIterator() {
		return new LevelOrderIterator();
	}
	
	 private class PreorderIterator implements Iterator<T> {
		private LinkedStack<TernaryNode<T>> stack;
		
		public PreorderIterator()
		{
			stack = new LinkedStack<TernaryNode<T>>();
			if(rootNode != null)
			{
				stack.push(rootNode);
			}
		}

		@Override
		public boolean hasNext() {
			return !stack.isEmpty();
		}

		@Override
		public T next() {
			TernaryNode<T> next;
			
			if(hasNext())
			{
				next = stack.pop();
				TernaryNode<T> leftChild = next.getLeftChild();
				TernaryNode<T> middleChild = next.getMiddleChild();
				TernaryNode<T> rightChild = next.getRightChild();
				
				if(rightChild!=null)
				{
					stack.push(rightChild);
				}
				
				if(middleChild!=null)
				{
					stack.push(middleChild);
				}
				
				if(leftChild!=null)
				{
					stack.push(leftChild);
				}
				
			} 
			else
			{
				throw new NoSuchElementException();
			}
			return next.getData();
		}
		
		public void remove()
		{
			throw new UnsupportedOperationException();
		}
		
	}
	 
	 private class PostorderIterator implements Iterator<T> {
		 private StackInterface<TernaryNode<T>> stack;
	        private TernaryNode<T> currentNode;

	        public PostorderIterator() {
	            stack = new LinkedStack<TernaryNode<T>>();
	            currentNode = rootNode;
	        }

	        public boolean hasNext() {
	            return (!stack.isEmpty() || (currentNode != null));
	        }
	        public T next() {
	            TernaryNode<T> leftChild = null;
	            TernaryNode<T> middleChild = null;
	            TernaryNode<T> nextNode = null;

	            while (currentNode != null) {
	                stack.push(currentNode);
	                leftChild = currentNode.getLeftChild();
	                middleChild = currentNode.getMiddleChild();
	                if(leftChild ==  null && middleChild == null)
	                {
	                    currentNode = currentNode.getRightChild();
	                }
	                else if(leftChild == null)
	                {
	                    currentNode = currentNode.getMiddleChild();
	                }
	                else
	                {
	                    currentNode = leftChild;
	                } 
	            }

	            if (!stack.isEmpty()) 
	            {
	                nextNode = stack.pop();
	                TernaryNode<T> parentNode = null;
	                if (!stack.isEmpty()) {
	                    parentNode = stack.peek();
	                    if (nextNode == parentNode.getLeftChild() && parentNode.getMiddleChild()!=null) {
	                        currentNode = parentNode.getMiddleChild();
	                    } else if (nextNode != parentNode.getRightChild()) {
	                      currentNode = parentNode.getRightChild();
	                    } else {
	                      currentNode = null;
	                    }
	                } 
	                else 
	                {
	                    currentNode = null;
	                }
	            } else {
	                throw new NoSuchElementException();
	            }

	            return nextNode.getData();
	        }
	 }
	 
	 private class LevelOrderIterator implements Iterator<T>{
		 private LinkedQueue<TernaryNode<T>> queue;

	        public LevelOrderIterator() {
	            queue = new LinkedQueue<TernaryNode<T>>();
	            if (rootNode != null) {
	                queue.enqueue(rootNode);
	            }
	        }

	        public boolean hasNext() {
	            return !queue.isEmpty();
	        }

	        public T next() {
	            TernaryNode<T> nextNode;

	            if (hasNext()) 
	            {
	                nextNode = queue.dequeue();
	                TernaryNode<T> leftChild = nextNode.getLeftChild();
	                TernaryNode<T> middleChild = nextNode.getMiddleChild();
	                TernaryNode<T> rightChild = nextNode.getRightChild();

	                // Add to queue in order of recursive calls
	                if (leftChild != null) 
	                {
	                    queue.enqueue(leftChild);
	                }

	                if(middleChild != null)
	                {
	                	queue.enqueue(middleChild);
	                }
	                
	                if (rightChild != null) 
	                {
	                    queue.enqueue(rightChild);
	                }
	            } else {
	                throw new NoSuchElementException();
	            }

	            return nextNode.getData();
	        }

	        public void remove() {
	            throw new UnsupportedOperationException();
	        }
	 }
}
