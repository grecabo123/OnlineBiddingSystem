import axios from 'axios'
import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';
import { Card } from 'primereact/card';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Tag } from 'primereact/tag';
import { Button } from 'primereact/button';
import { Dialog } from 'primereact/dialog';
import AccountDetails from './AccountDetails';

function AccountPending() {

    const [RegisteredData, setRegister] = useState([]);
    const [loading, setloading] = useState(true);
    const [Dataid, setDataId] = useState([]);
    const [visible, setVisible] = useState(false);

    useEffect(() => {
        axios.get(`/api/nonregistered`).then(res => {
            if (res.data.status === 200) {
                setRegister(res.data.accounts);
            }
            setloading(false)
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');

            }
        })
    }, []);

    

    const AccountStatus = (RegisteredData) => {
        return (
            <>
                {
                    RegisteredData.status === 1 ? <Tag className='p-tag' value="Active" severity={'success'} /> : <Tag value="In Active" className='p-tag' severity={'danger'} />
                }
            </>
        )
    }
    const Action_Btn = (RegisteredData) => {
        return (
            <>

                <Button className="p-button-info p-button-sm" data-id={RegisteredData.id} label="View" onClick={GetDetails} />
            </>
        )
    }

    const GetDetails = (e) => {
        setDataId(e.currentTarget.getAttribute('data-id'));
        setVisible(true)
    }
    const onHide = () => {
        setVisible(false)

    }

    return (
        <div className='container-fluid'>
            <Card title="Pending Account" >
                <DataTable loading={loading} value={RegisteredData} paginator paginatorLeft rows={10}>
                    <Column field='name_user' header="Name of User"></Column>
                    <Column field='email' header="Email"></Column>
                    <Column field='status' body={AccountStatus} header="Status"></Column>
                    <Column field='id' body={Action_Btn} header="Actions"></Column>
                </DataTable>
            </Card>

            <Dialog header="Account Details" visible={visible} position='top' draggable={false} onHide={onHide} breakpoints={{ '960px': '75vw', '640px': '100vw' }} style={{ width: '50vw' }}>
                <AccountDetails data={Dataid} />
            </Dialog>
        </div>
    )
}

export default AccountPending