#include "mprog.hpp"

/////////////////////////////////////////////////////////
struct MProg::Impl
{
    std::list<std::shared_ptr<MPROG_ACT_LIST>> ActLists;
    std::list<std::shared_ptr<MPROG_DATA>> MudProgs;
};

////////////////////////////////////////////////////////
MProg::MProg()
    : pImpl(std::make_unique<Impl>())
{

}

MProg::~MProg()
{

}

const std::list<std::shared_ptr<MPROG_ACT_LIST>> &MProg::ActLists() const
{
    return pImpl->ActLists;
}

void MProg::Add(std::shared_ptr<MPROG_ACT_LIST> mal)
{
    pImpl->ActLists.push_back(mal);
}

void MProg::Remove(std::shared_ptr<MPROG_ACT_LIST> mal)
{
    pImpl->ActLists.remove(mal);
}

const std::list<std::shared_ptr<MPROG_DATA>> &MProg::MudProgs() const
{
    return pImpl->MudProgs;
}

void MProg::Add(std::shared_ptr<MPROG_DATA> prog)
{
    pImpl->MudProgs.push_back(prog);
}

void MProg::Remove(std::shared_ptr<MPROG_DATA> prog)
{
    pImpl->MudProgs.remove(prog);
}

void MProg::InsertBefore(size_t pos, std::shared_ptr<MPROG_DATA> prog)
{
    size_t counter = 0;

    for(auto i = std::begin(pImpl->MudProgs); i != std::end(pImpl->MudProgs); ++i)
    {
        if(++counter == pos)
        {
            pImpl->MudProgs.insert(i, prog);
        }
    }
}
