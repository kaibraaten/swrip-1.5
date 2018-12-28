class Repository():
    """General purpose repository class"""
    def __init__(self):
        self.entities = []

class DescriptorRepository(Repository):
    """Mock repository for descriptors."""
    def __init__(self):
        super().__init__(self)
        