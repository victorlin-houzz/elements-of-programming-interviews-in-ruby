function Node(val) {
  this.val = val;
  this.left = null;
  this.right = null;
}

function BinarySearchTree(root = null) {
  this.root = root;
}

BinarySearchTree.prototype.insert = function (val) {
  let curr = this.root;
  let newNode = new Node(val);
  while (curr !== null) {
    if (curr.val > val) {
      if (curr.left !== null) {
        curr = curr.left;
      } else {
        curr.left = newNode;
        break;
      }
    } else {
      if (curr.right !== null) {
        curr = curr.right;
      } else {
        curr.right = newNode;
        break;
      }
    }
  }
};
