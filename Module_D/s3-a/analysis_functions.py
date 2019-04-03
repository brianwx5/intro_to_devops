from anytree import Node, RenderTree, AsciiStyle

def find_max_cpu_util(cpu_list):
    max = -1
    for c in cpu_list:
        if max < c:
            max = c
    return max

def find_max_cpu_util_tree(root_node):
    current_node = root_node
    while True:
        if current_node.is_root and len(current_node.children) > 0:
            current_node = current_node.children[0]
        else:
            if current_node.is_leaf:
                return current_node
            elif len(current_node.children) > 0:
                current_node = current_node.children[0]


if __name__ == '__main__':


    l = [0, 1, 2, 99.0, 118.0, 200.315, 75, 64, 22]
    print(find_max_cpu_util(l))



    # Example of a Binary Search Tree
    root = Node(99.0)

    root_rc = Node(99.5, parent=root)
    root_lc = Node(1, parent=root)

    rrc_rc = Node(100, parent=root_rc)
    rrc_rc_rc = Node(101, parent=rrc_rc)

    print(RenderTree(root, style=AsciiStyle()).by_attr())

    print(find_max_cpu_util_tree(root))
